class Node:
    def __init__(self, name):
        self.name = name
        self.children = []
        self.parents = []
        self.pagerank = .33




v1 = Node("v1")
v2 = Node("v2")
v3 = Node("v3")
v1.children.append(v2)
v1.children.append(v3)
v1.parents.append(v2)
#Add details for V2 and V3. 
v2.children.append(v1)
v2.parents.append(v1)
v2.parents.append(v3)
v3.children.append(v2)
v3.parents.append(v1)
node_list = [v1, v2, v3]
for node in node_list:
    in_neighbors = node.parents
    pagerank_sum = 0
    for parent in in_neighbors:
        pagerank = parent.pagerank / len(parent.children)
        pagerank_sum += pagerank
    #Add line to calculate pagerank
    print(node.name, pagerank_sum)