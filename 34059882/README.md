# rdar://34059882

### Summary
When using a `UICollectionViewFlowLayout` and setting it's `estimatedItemSize` property, calling `reloadData()` on the related `UICollectionView` instance fails to display cells that may have been added since the last call to `reloadData()`.

### Steps to Reproduce
1. Create an instance of `UICollectionViewFlowLayout`.
2. On the previously created layout, set its `estimatedItemSize` property to something other than `CGSize.zero`. This includes `UICollectionViewFlowLayoutAutomaticSize`.
3. Set the previously created layout on an instance of `UICollectionView`.
4. In the collection view's data source, return a arbitrary number from `collectionView(_:, numberOfItemsInSection:)`.
5. At some point later in time, call `reloadData()` on the collection view and return a new arbitrary number from `collectionView(_:, numberOfItemsInSection:)` that is **greater** than the number previously returned.

### Expected Results
The collection view should completely invalidate any existing items and then display the correct number of items returned from `collectionView(_:, numberOfItemsInSection:)`.

### Actual Results
The collection view calls `collectionView(_:, numberOfItemsInSection:)` for each section to learn an updated item count. However, it only calls `collectionView(_:, cellForItemAt:)` the number of times matching the item count **before** `reloadData()` was called. Therefore, the incorrect number of items are displayed.
