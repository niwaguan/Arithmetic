/**
 * 二叉树的序列化
 * https://leetcode-cn.com/problems/xu-lie-hua-er-cha-shu-lcof/
 */

function TreeNode(val) {
  this.val = val;
  this.left = this.right = null;
}
/**
 * Encodes a tree to a single string.
 *
 * @param {TreeNode} root
 * @return {string}
 */
var serialize = function (root) {
  if (!root) {
    return "";
  }

  let values = [];

  let queue = [root];
  while (queue.length > 0) {
    const node = queue.pop();
    if (node) {
      values.push(node.val);
    } else {
      values.push("null");
    }
    if (node && node !== "null") {
      queue.unshift(node.left);
      queue.unshift(node.right);
    }
  }

  return values.join(",");
};

/**
 * Decodes your encoded data to tree.
 *
 * @param {string} data
 * @return {TreeNode}
 */
var deserialize = function (data) {
  if (!data) {
    return null;
  }
  const values = data.split(",");
  if (values.length <= 0) {
    return null;
  }
  const nodeAtIndex = (index) => {
    if (index >= values.length) {
      return null;
    }
    const value = values[index];
    if (value === "null") {
      return null;
    }
    return new TreeNode(value);
  };
  let root = nodeAtIndex(0);
  let index = 1;
  let queue = [root];

  while (queue.length > 0) {
    const node = queue.pop();
    if (index < values.length) {
      node.left = nodeAtIndex(index);
    }
    if (node.left) {
      queue.unshift(node.left);
    }
    index += 1;

    if (index < values.length) {
      node.right = nodeAtIndex(index);
    }
    if (node.right) {
      queue.unshift(node.right);
    }
    index += 1;
  }
  return root;
};
