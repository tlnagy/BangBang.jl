implements(::Mutator, ::Type{<:StaticArrays.StaticArray}) = false
implements(::typeof(setindex!), ::Type{<:StaticArrays.MArray}) = true
