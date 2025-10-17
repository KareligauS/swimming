class Transform {
    Transform parent;
    private Vector2 localPosition = new Vector2();
    private float localRotation;

    Transform() {}

    Transform(Transform another) {
        SetParent(another.parent);
        SetPosition(another.localPosition);
        SetRotation(another.localRotation);
    }

    Transform(Vector2 _localPosition, float _localRotation){
        SetPosition(_localPosition);
        SetRotation(_localRotation);
    }

    void SetRotation(float _rotation){
        localRotation = _rotation; 
    }

    void SetPosition(Vector2 _position){
        localPosition = new Vector2(_position);
    }

    void SetParent(Transform _parent){
        if (_parent == null) {
            println("Parent is null");
            return;
        }

        localPosition = GetGlobalPosition().Substitute(_parent.GetGlobalPosition());
        localRotation = GetGlobalRotation() - _parent.GetGlobalRotation();

        parent = _parent;
    }

    void UnsetParent(){
        localPosition = GetGlobalPosition();
        localRotation = GetGlobalRotation();
        parent = null;
    }

    Vector2 GetGlobalPosition(){
        if (parent == null) return localPosition;
        
        Vector2 rotationOffset = localPosition.Rotate(parent.GetGlobalRotation());
        return parent.GetGlobalPosition().Sum(rotationOffset);
    }

    float GetGlobalRotation(){
        if (parent == null) return localRotation;

        return localRotation + parent.GetGlobalRotation();
    }
}