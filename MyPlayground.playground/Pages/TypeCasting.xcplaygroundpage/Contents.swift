    // 인스턴스의 타입을 확인하거나 어떠한 클래스의 인스턴스를
    // 해당 클래스 계층 구조의 슈퍼 클래스나 서브 클래스로 취급하는 방법
    // 단순히 타입을 확인하는 용도로도 사용
    // is , as 사용
    // is : Checking Type
    // as : Type Casting

    import Foundation

    class MediaItem{
        var name : String
        init(name : String){
            self.name = name
        }
    }

    class Movie : MediaItem{
        var director : String
        init(name : String, director : String){
            self.director = director
            super.init(name :name)
        }
    }

    class Song : MediaItem{
        var artist : String
        init(name :String, artist : String){
            self.artist = artist
            super.init(name:name)
        }
    }

    let library = [
        Movie(name: "기생충", director : "봉준호"),
        Song(name: "Byutter", artist : "BTS"),
        Movie(name: "올드보이", director : "박찬욱"),
        Song(name: "Wonderwall", artist : "Oasis"),
        Song(name: "Rain", artist : "이적")
    ]

    var movieCount = 0
    var songCount = 0

    // 인스턴스의 타입 확인 : is
    for item in library {
        if item is Movie {
            movieCount += 1
        }else if item is Song{
            songCount += 1
        }
    }

    print("Media library contanins \(movieCount) movies and",
        "\(songCount) songs")
          

    // as : 다운 캐스팅
    // 하위 클래스의 인스턴스를 참조
    // 표현식 as["","?","!"] (변환 할)Type
    // as? -> 조건부 형식 : 다운 캐스팅 옵션
    // as! -> 강제 언래핑 : 항상 성공시 시도

    for item in library { //다운 캐스팅 가능 할 경우 출력
        // 다운 캐스팅 성공 시 다운 캐스팅 타입에 접근
        if let movie = item as? Movie{
            print("Movie : \(movie.name), dir. \(movie.director)")
        } else if let song = item as? Song {
            print("Song \(song.name), by \(song.artist)")
        }
    }

    // [ 업 캐스팅 ] : 서브 클래스 인스턴스를 슈퍼 클래스 타입으로 참조
    // -> 항상 성공, 부모 클래스(슈퍼)가 같을 경우 업 캐스팅 성공
    // [ 다운 캐스팅 ] : 슈퍼 클래스 인스턴스를 서브 클래스 타입으로 참조
    // -> 실패 가능성 , 상위 인스턴스를 생성,제한된 기능 제공
