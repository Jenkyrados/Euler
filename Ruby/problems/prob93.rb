require 'rgl/adjacency'
require 'rgl/connected_components'

dg = RGL::DirectedAdjacencyGraph[]

h = Hash.new(0)

for x in 1...1e6
	v = 2*x
	while v < 1e6
		h[v] +=x
		v +=x
	end
	if h[x] > x || dg.has_vertex?(h[x])
		dg.add_edge x,h[x]
	end
end
comps = dg.strongly_connected_components
comp_id = comps.comp_map.values.group_by { |e| e }.values.max_by(&:size).first
p (1..1e6).select{|x| comps.comp_map[x] == comp_id}.min
