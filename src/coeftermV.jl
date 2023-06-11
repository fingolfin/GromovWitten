function Sfunction(x,k)
    su=0
   for n in 0:k
       su=su+(1//(2^(2n)))//(factorial(2*n+1))*(x)^(2*n)
       
   end
   return su
end
function InvSfunction(x,k)
    su=0
    for n in 0:k+1
        su=su-(((1//2^(n))*(-2 + 2^n)*bernoulli(n))//(factorial(n)))*x^n
        
    end
    return su
end
function looptermV( z::fmpq_mpoly,q::fmpq_mpoly, aa::Integer, a::Integer)
    p=0
   if a==0
       return p
   else 
       for w in 1:a
           if a%w==0
               S1=Sfunction(w*z,aa)
               p = p + S1*S1*w*q^(a)
           end
       end
   end
       return p
end
function coefterm2Z(R::Nemo.FmpqMPolyRing, x::Vector, q::Vector,z::Vector,hp::fmpq_mpoly,g::Vector) 
    g=2 .* g
    if hp==0
        return 0
    else
        hp=coeff(hp,z,g)
    end
    return hp
end
function coeftermX(R::Nemo.FmpqMPolyRing, x::Vector, q::Vector,z::Vector,G::graphe ,p::fmpq_mpoly,d::Integer;l=zeros(Int,nv(G)))
    r=gens(R)
    m=r[1:nv(G)]
    ee=Edge.(G.edge)
    G=DiGraph(Edge.(G.edge))
    L=zeros(Int,nv(G))
    for ev in ee
        if src(ev) == dst(ev)

        else
            L[src(ev)]=L[src(ev)]+d
            L[dst(ev)]=L[dst(ev)]+d
        end
    end
    L=L .+l
    p=coeff(p,m,L)
    return p
end
