import UIKit

///
///
class ViewController: UITableViewController
{

    let cellIdentifier = "CellIdentifier"
    var rows:[DemoRow]!

    // MARK: LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        rows = [
            DemoRow(title: "Editor Demo", action: { self.showEditorDemo() }),
            DemoRow(title: "Empty Editor Demo", action: { self.showEditorDemo(loadSampleHTML: false) })
        ]
    }


    // MARK: Actions


    func showEditorDemo(loadSampleHTML: Bool = true) {
        let controller = EditorDemoController()
        controller.loadSampleHTML = loadSampleHTML
        navigationController?.pushViewController(controller, animated: true)
    }

    // MARK: TableView Methods


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        cell.accessoryType = .disclosureIndicator

        let row = rows[indexPath.row]
        cell.textLabel?.text = row.title

        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        rows[indexPath.row].action()
    }

}


typealias RowAction = () -> Void


struct DemoRow {
    var title: String
    var action: RowAction
}
