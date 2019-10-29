//
//  SettingsList.swift
//  RecycleMK
//
//  Created by John Yorke on 28/10/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import SwiftUI
import Intents
import IntentsUI

final class SettingsViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return cell(withTitle: "Add to Siri")
        default:
            return cell(withTitle: "Go to council website")
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            addToSiri()
        default:
            goToWebsite()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func cell(withTitle title: String) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        cell.tintColor = .green
        cell.textLabel?.text = title
        return cell
    }

    func goToWebsite() {
        UIApplication.shared.open(URL(string: "https://www.milton-keynes.gov.uk/waste-recycling")!, options: [:], completionHandler: nil)
    }

    func addToSiri() {
        let intent = IsItRecyclableIntent()
        intent.suggestedInvocationPhrase = "Check Recycling"
        if let shortcut = INShortcut(intent: intent) {
            let viewController = INUIAddVoiceShortcutViewController(shortcut: shortcut)
            viewController.modalPresentationStyle = .formSheet
            viewController.delegate = self
            present(viewController, animated: true, completion: nil)
        }
    }
}

extension SettingsViewController: INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) { }

    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension SettingsViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = SettingsViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<SettingsViewController>) -> SettingsViewController.UIViewControllerType {
        return SettingsViewController()
    }

    func updateUIViewController(_ uiViewController: SettingsViewController, context: UIViewControllerRepresentableContext<SettingsViewController>) { }
}

struct SettingsList : View {

    var body: some View {
        NavigationView {
            List {
                SettingsViewController()
            }
            .listStyle(GroupedListStyle())
            .environment(\.defaultMinListRowHeight, 96)
            .navigationBarTitle(Text("More"), displayMode: .large)
            .padding([.leading, .trailing], -12)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#if DEBUG
struct SettinsPreview : PreviewProvider {
    static var previews: some View {
        Group {
            SettingsList()
        }
    }
}
#endif
