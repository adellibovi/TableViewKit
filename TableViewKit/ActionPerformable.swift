import Foundation

public enum ItemAction {
    case copy
    case paste

    init?(action: Selector) {
        switch action {
        case #selector(UIResponderStandardEditActions.copy(_:)):
            self = .copy
        case #selector(UIResponderStandardEditActions.paste(_:)):
            self = .paste
        default:
            return nil
        }
    }
}

/// A type that represent an item that can perform some action like copy and paste
public protocol ActionPerformable: Item {

    /// Asks if the editing menu should omit the Copy or Paste command
    ///
    /// - Parameter action: Either `.copy` or `.paste`
    /// - Returns: `true` if the command corresponding to action should appear in the editing menu, otherwise `false`.
    func canPerformAction(_ action: ItemAction) -> Bool

    /// Tells the item to perform a copy or paste operation
    ///
    /// - Parameter action: Either `.copy` or `.paste`
    func performAction(_ action: ItemAction)
}
