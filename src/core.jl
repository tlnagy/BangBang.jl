may(mutate, args...) =
    if possible(mutate, args...)
        mutate(args...)
    else
        pure(mutate)(args...)
    end

pure(::typeof(push!)) = push
pure(::typeof(append!)) = append

ImmutableContainer = Union{
    NamedTuple,
    Tuple,
}

ismutable(x) = ismutable(typeof(x))
ismutable(T::Type) = error("mutability unknown for type $T")  # maybe `false`?
ismutable(::Type{<:ImmutableContainer}) = false
ismutable(::Type{<:AbstractArray}) = true
ismutable(::Type{<:AbstractDict}) = true
ismutable(::Type{<:AbstractSet}) = true
ismutable(::Type{<:AbstractString}) = false

# trymutate(::typeof(push!)) = push!!
# trymutate(::typeof(append!)) = append!!