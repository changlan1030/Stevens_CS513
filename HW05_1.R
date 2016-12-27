# 5.1
rm(list=ls())

# Create two vectors x and y
x<-c(7,10,13,21,28,28,35,43,44,50)
y<-c(57,62,63,71,78,88,89,90,94,98)

# Combine x and y
xy<-cbind(x,y)

# Compute euclidean and return the distance matrix
dxy<-dist(xy)

# Hierarchical clustering
hxy<-hclust(dxy)

# Plot the cluster
plot(hxy)

# Hierarchical clustering using average linkage method
hxy<-hclust(dxy,method="average")

# Plot the cluster
plot(hxy)

rm(list=ls())