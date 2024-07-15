//
//  MockData.swift
//  Flickr
//
//  Created by Keith Dougherty on 7/14/24.
//

extension Photos {
    enum Mock {
        public static var photos = Photos(title: "Recent Uploads tagged d",
                                          link: "https://www.flickr.com/photos/tags/d/",
                                          description: "",
                                          items: [.Mock.item])
    }
}

extension PhotoDetails {
    enum Mock {
        public static var item = PhotoDetails(title: "Visitation from Lodge St Conval Giffnock No 1359",
                                              link: "https://www.flickr.com/photos/camsinlux/53856803506/",
                                              media: ["m":"https://live.staticflickr.com/65535/53856803506_718099b49a_m.jpg"],
                                              description: " <p><a href=\"https://www.flickr.com/people/camsinlux/\">cams-not-in-lux</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/camsinlux/53856803506/\" title=\"Visitation from Lodge St Conval Giffnock No 1359\"><img src=\"https://live.staticflickr.com/65535/53856803506_718099b49a_m.jpg\" width=\"240\" height=\"160\" alt=\"Visitation from Lodge St Conval Giffnock No 1359\" /></a></p> ",
                                              author: "nobody@flickr.com (\"cams-not-in-lux\")",
                                              published: "2024-07-13T23:53:55Z",
                                              tags: "a andrewgrainger andrewhamilton campbell cams d darylcollins freemasonry graemehay j johnstewartpgl kevinbarton lodgestconvalgiffnockno1359 lodgestmoliosno774 people rickyeaglesham family")
    }
}
