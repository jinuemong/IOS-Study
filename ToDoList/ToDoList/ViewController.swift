//
//  ViewController.swift
//  ToDoList
//
//  Created by 김진우 on 2023/05/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    // Task 배열 선언 후 초기화
    var tasks = [Task](){
        // 프로퍼티 옵저버
        // 할 일이 추가 될 때마다 userDefault에 데이터 저장
        didSet{
            self.saveTasks()
        }
    }
    
    // editButton은 strong으로 선언해야 함
    // done으로 아이템을 변경 시 메모리에서 해제 됨
    // 재사용하기 위해서는 weak가 아닌 strong으로 선택
    @IBOutlet var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // #selector : 동적 호출을 위함 (object -c 의 기능 확장)
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks() // 저장 된 할일 불러오기
    }

    // object-c와의 호환성을 위함
    // doneButton의 메서드 호출
    @objc func doneButtonTap(){
        // 다시 에딧 모드에서 전환
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true)
    }

    @IBAction func editButton(_ sender: UIBarButtonItem) {
        // edit 버튼 클릭 시 동작
        // 테이블 뷰가 비어있으면 동작 안함
        guard !self.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = self.doneButton
        // 테이블 뷰가 편집 모드로 전환
        self.tableView.setEditing(true, animated: true)
    }
    @IBAction func plusButton(_ sender: UIBarButtonItem) {
        // 메시지 창
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        // handler에 클로저를 등록해서 register 조작 시 호출
        // 클래스처럼 클로저는 참조 타입이기 때문에 클래스의 본문에서 self로 클래스의 인스턴스로 접근할 때
        // 두개의 객체가 상호 참조하는 경우 강한 순환 참조 발생 -> 연관 된 객체들은 메모리 누수가 발생함 (account가 0에 도달하지 않게 됨)
        // 클로저의 선언 부에서 캡처 목록을 정의함으로써 강한 순환 참조 해결 가능  : [weak self]
        let registerButton = UIAlertAction(title: "등록", style: .default,handler: { [weak self] _ in
            // 등록 버튼에 입력 된 텍스트 버튼 가져오기
            guard let title = alert.textFields?[0].text else {return }
            // Task 객체 생성
            let task  = Task(title: title, done: false)
            // Task 객체 추가
            self?.tasks.append(task)
            self?.tableView.reloadData() // 데이터 갱신
            // 디버그 창에 출력
            debugPrint("\(title)")
        })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel,handler: nil)
        
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        // 텍스트 필드 추가
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "할 일을 입력해주세요."
        })
        self.present(alert, animated: true, completion: nil)
    }
}


// 상속 : DataSource
extension ViewController: UITableViewDataSource{
    // 아래 두가지 메서드를 반드시 구현해야 함
    
    // 배열의 갯수 카운트
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    // 특정 섹션의 n번째 row를 그리는데 필요한 셀을 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueReusableCell : 지정된 재사용 식별자에 대한 재사용 가능한 테이블 뷰 셀 객체를 반환 후 테이블 뷰에 추가
        // 재사용 식별자 : withIdentifier 의 Cell
        // withIdentifier 값을 가지고 재사용할 셀을 찾음
        // for : indexPath를 넘겨줌
        // indexPath 위치에 해당 셀들을 재사용하기 위함
        // -> 불필요한 메모리 낭비를 최소화하기 위한 과정
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row] //섹션 * 로우로 구분
        cell.textLabel?.text = task.title
        if task.done { // done 상태일 때 뷰 변화 : checkmark
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell
    }
    
    // 편집 모드에서 삭제버튼을 눌렀을 때 어떤 셀이 선택되었는지 알려줌
    func tableView(_ tableView: UITableView, commit: UITableViewCell.EditingStyle, forRowAt indexPath : IndexPath){
            self.tasks.remove(at: indexPath.row)
            // 행 인덱스와 자동 모드를 적용
            tableView.deleteRows(at: [indexPath], with: .automatic)
        
        // tasks가 빈 경우 편집모드를 제거
        if self.tasks.isEmpty{
            self.doneButtonTap()
        }
    }
    
    // cell 이동 함수
    // source에서 destination으로 이동
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = self.tasks
        let task  = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row) //기존 값 삭제
        tasks.insert(task, at: destinationIndexPath.row) //이동할 곳으로 생성
        self.tasks = tasks // 재정렬된 배열로 전환
    }
    // 앱이 재실행되면 데이터가 리셋되는 현상 방지
    // 앱 내부에 데이터 저장 : userDefault
    func saveTasks(){
        //map : 배열에 있는 데이터를 딕셔너리 형태로 전환
        let data = self.tasks.map{
            [
                "title" : $0.title,
                "done" : $0.done
            ]
        }
        
        // UserDefaults : 싱글톤 데이터라서 하나의 인스턴스만 존재
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    // 저장 된 값을 불러옴
    func loadTasks(){
        let userDefaults = UserDefaults.standard
        // 딕셔너리 형태로 저장했으므로 타입 캐스팅 진행
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
        self.tasks = data.compactMap{
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        }
    }
}

// 상속 : Delegate
extension ViewController : UITableViewDelegate{
    // 어떤 셀이 선택 되었는지 확인
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task  = self.tasks[indexPath.row]
        task.done =  !task.done // 클릭 시 전환
        self.tasks[indexPath.row] = task // 데이터 변환
        // 선택 된 셀만 리로드
        // automatic : 애니메이션을 적절하게 선택
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
