@testset "feynmanint.jl" begin
    ve=[(1, 1), (1, 2), (2, 3), (3, 1)]
    G=graph(ve)
    R,x,q,z=polynomialring(G,"x","q","z")
    a=[2,0,0,1]
    o=[1,2,3]
    @test feynman_integral_branchtype_order(x,q,z,G,a,o)==3*q[1]^2*q[4]
    @test feynman_integral_branchtype(x,q,z,G,a,aa=1,l=[0,0,0],g=[0,0,0])==6*q[1]^2*q[4]
    @test feynman_integral_degree_order(x,q,z,G,o,3)==3*q[1]^2*q[4] + q[1]*q[2]*q[3] + q[1]*q[2]*q[4] + q[1]*q[3]*q[4] + 9*q[1]*q[4]^2
    @test subt(feynman_integral_degree_order(x,q,z,G,o,3))==15
    @test subt(feynman_integral_degree(x,q,z,G ,3))==90
end