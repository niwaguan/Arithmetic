class LRUCache {

    /// 容量及标识
    constructor(capability, identifier) {
        this.capability = capability
        this.identifier = identifier

        this.enableLog = false
        this.head = null
        this.tail = null
        this.cacheMap = new Map()
    }

    /// 缓存一个键值
    /// value === null || value === undefined 可删除已缓存的值
    set(value, key) {
        if (Boolean(key) === false) {
            return
        }

        if (value === null || value === undefined) {
            this._removeNodeByKey(key)
            this._log(`remove value for key ${key}`)
            return
        }

        const node = this.cacheMap.get(key)
        if (node) {
            this._log(`hit cache with key: ${key}`)
            this._log(`removing node (key: ${key}) to link head`)
            this._remove(node)
            this._unshift(node)
            this._log(`removed node (key: ${key}) to link head`)
        } else {
            const node = new LRUCacheNode(value)
            this.cacheMap.set(key, node)
            this._unshift(node)
            this._log(`add node (value: ${value}, key: ${key})`)
        }

    }

    /// 根据键取值
    get(key) {
        const node = this.cacheMap.get(key)
        if (node) {
            this._log(`hit cache with key: ${key}`)
            // 将node从原来的位置移动到链表头部
            this._log(`removing node (key: ${key}) to link head`)
            this._remove(node)
            this._unshift(node)
            this._log(`removed node (key: ${key}) to link head`)
            return node.value
        }
        this._log(`cache missed key: ${key}`)
    }

    /// 在首部插入节点
    _unshift(node) {
        if (this.head) {
            node.next = this.head
            this.head.pre = node
            node.pre = null
            this.head = node
        } else {
            this.head = this.tail = node
        }
    }

    /// 删除首部节点
    _shift() {
        const next = this.head.next

        this.head.next.pre = null
        this.head.next = null
        this.head = next
    }

    /// 尾部插入节点
    _push(node) {
        if (this.tail) {
            this.tail.next = node
            node.pre = this.tail
            this.tail = node
            node.next = null
        } else {
            this.head = this.tail = node
        }
    }

    /// 删除链表尾部节点
    _pop() {
        const pre = this.tail.pre

        this.tail.pre.next = null
        this.tail.pre = null
        this.tail = pre
    }

    /// 移除指定节点
    _remove(node) {
        if (node === this.head) {
            this._shift()
        } else if (node === this.tail) {
            this._pop()
        } else {

            node.pre.next = node.next
            node.next.pre = node.pre

            node.pre = null
            node.next = null
        }
    }

    _removeNodeByKey(key) {
        const node = this.cacheMap.get(key)
        if (node) {
            this._remove(node)
        }
    }

    /// log
    _log(...message) {
        if (this.enableLog === false) {
            return
        }
        console.log(...message)
    }
}

class LRUCacheNode {
    constructor(value) {
        this.value = value
        this.next = null
        this.pre = null
    }
}

var testfunc = function() {
    const keys = new Array()
    const values = new Array()

    const cache = new LRUCache(0)
    cache.enableLog = true

    var count = 20
    var begin = null
    var end = null

    console.log('set value into cache...')
    begin = new Date()
    for (let i = 0; i < count; ++i) {
        cache.set(`value ${i}`, i)
    }
    end = new Date()
    console.log('set value completed!')
    console.log(`use time ${end - begin}`)

    console.log('get value from cache...')
    begin = new Date()
    for (let i = 0; i < count; ++i) {
        console.log(`key: ${i}`, cache.get(i))
    }
    end = new Date()
    console.log('get value from cache complete!')
    console.log(`use time ${end - begin}`)
}