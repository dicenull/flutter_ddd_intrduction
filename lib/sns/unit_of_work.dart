class UnitOfWork {
  static get current => _current;

  static final UnitOfWork _current = UnitOfWork();

  void registerNew(Object o) {}
  void registerDirty(Object o) {}
  void registerClean(Object o) {}
  void registerDeleted(Object o) {}
  void commit() {}
}

mixin Entity {
  void markNew() {
    UnitOfWork.current.registerNew(this);
  }

  void markDirty() {
    UnitOfWork.current.registerDirty(this);
  }

  void markClean() {
    UnitOfWork.current.registerClean(this);
  }

  void markDeleted() {
    UnitOfWork.current.registerDeleted(this);
  }
}
