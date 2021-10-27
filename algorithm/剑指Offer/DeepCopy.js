function Node(val, next, random) {
  this.val = val;
  this.next = next;
  this.random = random;
}

const printNode = (id, head) => {
  let current = head;
  let values = new Array();
  while (current) {
    let x = "null";
    if (current.random) {
      x = current.random.val;
    }
    values.push(`${current.val}(${x})`);
    current = current.next;
  }
  console.log(id, values.join("->"));
};

var copyRandomList = function (head) {
  if (!head) {
    return null;
  }
  // 重复节点
  // 1->2->3->4  变成 1->1->2->2->3->3->4->4
  let current = head;
  while (current) {
    const next = current.next;
    const copy = new Node(current.val, next, null);
    current.next = copy;
    current = next;
  }
  // printNode("----", head);
  // 根据旧链表，更新新链表的random值
  current = head;
  while (current) {
    // 记录就链表的 next 节点
    // 经过上一步的复制，存在current，则一定存在current.next
    const next = current.next.next;
    if (current.random) {
      current.next.random = current.random.next;
    }
    current = next;
  }
  // printNode("----", head);
  // 分离新旧链表
  let ret = new Node(0, null, null);
  let retCurrent = ret;
  current = head;
  while (current) {
    // 记录旧链表的next
    const next = current.next.next;

    // 更新新链表的
    retCurrent.next = current.next;
    retCurrent = retCurrent.next;

    // 恢复旧链表
    current.next = next;
    current = next;
  }
  return ret.next;
};

const node7 = new Node(7, null, null);
// const node13 = new Node(13, null, null);
// const node11 = new Node(11, null, null);
// const node10 = new Node(10, null, null);
// const node1 = new Node(1, null, null);

// node7.next = node13;
// node13.next = node11;
// node11.next = node10;
// node10.next = node1;

// node13.random = node7;
// node11.random = node1;
// node10.random = node13;
// node1.random = node7;

const head = node7;
printNode("head", head);
const copy = copyRandomList(head);
printNode("head", head);
printNode("copy", copy);
