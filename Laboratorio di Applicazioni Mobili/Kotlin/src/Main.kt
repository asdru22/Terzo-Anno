fun main() {
    var x = 45.5
    var y: Double = 24.0
    x+=y
    println("ho $x bambini in cantina")

    var z = if(x<1.0) 2 else 4

    val arr = IntArray(4)
    arr[2] = 1251
    arr.forEach{
        n->println(n)
    }

    val myList: List<String> = listOf("among","us","imposter")
    myList.forEach {
        c->print("$c ")
    }
}