import UIKit
import Foundation

let names = ["chris", "alex", "ewa", "barry", "daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reservedNames = names.sorted(by: backward)
reservedNames = names.sorted(by: { s1, s2 in  return s1 > s2})


//inferring  type from context
