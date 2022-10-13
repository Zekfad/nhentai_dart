/// Generic parser function definition.
typedef TryParseFunction<T> = TryParseFunctionFrom<T, dynamic>;

/// Parser function taking an [Input] and returns object of type [T] or `null`.
typedef TryParseFunctionFrom<T, Input> = T? Function(Input object);
