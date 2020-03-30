/*
 Guard Let vs. If Let in Swift
 Author: Nicholas Zufelt
 Date: 2020-03-26
 */

// Consider the following function, to begin:
let users = ["nz999", "tk421", "er253"]
let passwords = ["fishfishfish", "notsecure", "default"]

func login(username: String?, password: String?) -> Bool {
    // Check if the function was called with a username:
    if let user = username {
        // Check for user in "database":
        if let index = users.firstIndex(of: user) {
            // Check if the function was called with a password:
            if let pw = password {
                // Check if password lines up with username:
                if pw == passwords[index] {
                    // Authentication Successful!
                    return true
                } else {
                    // Bad password for username
                    return false
                }
            } else {
                // No password submitted
                return false
            }
        } else {
            // Username not found
            return false
        }
    } else {
        // No username submitted
        return false
    }
}

// ----- test code -----
struct TestCase {
    let username: String?
    let password: String?
    let expected: Bool
    let description: String
}

let testCases: [TestCase] = [
    TestCase(username: nil,         password: "password",   expected: false, description: "No username submitted"),
    TestCase(username: "nz999",     password: nil,          expected: false, description: "No password submitted"),
    TestCase(username: "fakeUser",  password: "password",   expected: false, description: "Username not found"),
    TestCase(username: "er253",     password: "password",   expected: false, description: "Bad password for username"),
    TestCase(username: "tk421",     password: "notsecure",  expected: true,  description: "Authentication Successful!")
]

for testCase in testCases {
    let result: Bool = login(username: testCase.username, password: testCase.password)
    assert(result == testCase.expected, "failure in test case: \(testCase.description)")
    print("success for case: \(testCase.description)")
}
