# Testovoe iOS Mireshkin

A description of this package.

2. Объясните почему блок "Work 2" не выполняется?
let serialQueue = DispatchQueue(label: "com.foo.bar")
serialQueue.async {
print("Work 1")
serialQueue.sync {
print("Work 2")
}
}

sync блокирует текущую очередь (serialQueue).
