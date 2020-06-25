<<-NOTES
Build a library for directed Graphs
NOTES
#
# graph = Graph.new
# #graph = Graph<Integer>.new
#
# node7 = graph.add_node(7)
# node8 = graph.add_node(8)
# # graph.add_node(Graph::Node.new(7))
#
# #def add_directed_edge(from, to)
# graph.add_directed_edge(node7, node8)
# graph.add_directed_edge(7, 8, {type: "friend"})
# #node7.add_edge(node8, {type: "friend"})
#
# graph.remove_node(7)
# graph.remove_directed_edge(7, 8, {type: "friend"})
#
# graph.get_nodes # Set<Node>
# graph.get_edges # Set<Edge>

<<-OTHER_OPS
Iteration functionality
* graph.visit -- GraphCollectionSomething.visit(graph)
* df_visit{pre, in, post}
* bf_visit

Search functionality
* {df, bf}s

Higher level functionality
* connected components
* shortest_path(from, to)

        0
    1          2
3       4   5       6
OTHER_OPS


#class Graph
#   outbound_edges # Map<Node, Node>
#end
#
#class Node
#   out_nodes # Set<Node>
#end

#boolean pathExist(from, to)

require 'set'
class Graph
    def initialize
       @nodes = Set.new
       @outbound_edges = {}
    end

    def add(value)
        @nodes << value
    end

    def add_directed_edge(from, to)
        @outbound_edges[from] ||= Set.new
        @outbound_edges[from] << to
    end

    def path_exists?(from, to)
        visited = Set.new
        queue = [from]

        loop do
            break if queue.empty?

            node = queue.shift()
            next if visited.include?(node)

            visited << node

            return true if node == to

            related = @outbound_edges[node]
            next if related.nil?

            queue += related.to_a
        end

        return false
    end
end

graph = Graph.new
0.upto(6) do |i|
    graph.add(i)
end
graph.add_directed_edge(0, 1)
graph.add_directed_edge(0, 2)


puts graph.path_exists?(0, 1)
puts graph.path_exists?(1, 0)
