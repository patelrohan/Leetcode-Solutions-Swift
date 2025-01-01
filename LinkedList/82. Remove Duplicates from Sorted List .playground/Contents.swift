
/**
 * 82. Remove Duplicates from Sorted List II:  https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
 *
 * Problem Description:
 * Given the head of a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list. Return the linked list sorted as well.
 *
 * Examples:
 * - Input: head = [1,2,3,3,4,4,5]
 *   Output: [1,2,5]
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        var current = head
        var dummy: ListNode? = ListNode(0)
        dummy?.next = head
        var previous: ListNode? = dummy

        while (current != nil){
            
            //if current node is duplicate
            if(current?.next?.val == current?.val){
                
                //move to last duplicate node
                while(current?.next?.val == current?.val){
                    current = current?.next
                }
                
                //point previous.next to current.next to remove confirmed duplicates
                previous?.next = current?.next
            }
            else{
                previous = previous?.next
            }
            
            //move to next node
            current = current?.next
        }
        
        return dummy?.next
    }


