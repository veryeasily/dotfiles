// Make F open a single link in a new, inactive tab
map('F', 'C');
map('<Alt-e>', '<Alt-s>');
cmap('<Ctrl-j>', '<Tab>');
cmap('<Ctrl-k>', '<Shift-Tab>');

addSearchAlias('am', 'Amazon', 'https://www.amazon.com/s/ref=nb_sb_noss_1?url=search-alias%3Daps&field-keywords=');
addSearchAlias('lg', 'Library Genesis', 'http://gen.lib.rus.ec/search.php?req=');
addSearchAlias('et', 'Online Etymological Dictionary', 'https://www.etymonline.com/search?q=');

aceVimMap('jk', '<Esc>', 'insert');

mapkey('O', '', function() {
  Front.openOmnibar({
    type: "URLs",
    extra: "getAllSites",
    tabbed: false
  })
})

mapkey('su', '#4Edit current URL with vim editor', function() {
  Front.showEditor(window.location.href, function(data) {
    window.location.href = data
  }, 'url');
});

// From
// https://gist.github.com/b0o/a91d5fca1d762ecf43ea75af3685d651/ea2e721344218b14db5e80d136a2c25fb2e8d6f8

// Search & completion
// Search leader
let sl = 'a';

// Search engines
var search = [
    { alias:  'go'
    , name:   'google'
    , search: 'https://www.google.com/search?q='
    , compl:  'https://www.google.com/complete/search?client=chrome-omni&gs_ri=chrome-ext&oit=1&cp=1&pgcl=7&q='
    , callback: function(response) {
        Omnibar.listWords(JSON.parse(response.text)[1]);
      }
    },
    { alias:  'yt' // NOTE: You need to get an API key for the 'YouTube Data API v3' from the API Manager within your Google Cloud Console.
    , name:   'youtube'
    , search: 'https://www.youtube.com/search?q='
    , compl:  'https://www.googleapis.com/youtube/v3/search?maxResults=20&part=snippet&type=video,channel&key=__YOUR_API_KEY_HERE__&safeSearch=none&q='
    , callback: function(response) {
        var res = JSON.parse(response.text)["items"];
        Omnibar.listResults(res, function(s) {
          switch(s["id"]["kind"]) {
            case "youtube#channel":
              return Omnibar.createURLItem({
                title: s["snippet"]["channelTitle"] + ": " + s["snippet"]["description"],
                url:   "https://youtube.com/channel/" + s["id"]["channelId"]
              });
              break;
            case "youtube#video":
              return Omnibar.createURLItem({
                title: " ▶ " + s["snippet"]["title"],
                url:   "https://youtu.be/" + s["id"]["videoId"]
              });
              break;
          }
        });
      }
    },
    { alias:  'de'
    , name:   'define'
    , search: 'http://onelook.com/?w='
    , compl:  'https://api.datamuse.com/words?md=d&sp=%s*'
    , callback: function(response) {
        var res = JSON.parse(response.text);
        var defs = [];
        res.map(function(r){
            if (!r.defs || r.defs.length === 0) {
              defs.push([r.word, "", ""]);
              return
            }
            r.defs.map(function(d) {
              d = d.split("\t")

              var sp  = "(" + d[0] + ")",
                  def = d[1];

              defs.push([r.word, sp, def]);
            });
        });
        Omnibar.listResults(defs, function(d) {
          var li = $('<li/>').html('<div class="title"><strong>{0}</strong> <em>{1}</em> {2}</div>'.format(
            d[0], d[1], d[2]
          ));
          li.data('url', "http://onelook.com/?w=" + d[0]);
          return li;
        });
      }
    },
    { alias:  'dg'
    , name:   'duckduckgo'
    , search: 'https://duckduckgo.com/?q='
    , compl:  'https://duckduckgo.com/ac/?q='
    , callback: function(response) {
        var res = JSON.parse(response.text).map(function(r){
            return r.phrase;
        });
        Omnibar.listWords(res);
      }
    },
    { alias:  'aw'
    , name:   'archwiki'
    , search: 'https://wiki.archlinux.org/index.php?go=go&search='
    , compl:  'https://wiki.archlinux.org/api.php?action=opensearch&format=json&formatversion=2&namespace=0&limit=10&suggest=true&search='
    , callback: function(response) {
        Omnibar.listWords(JSON.parse(response.text)[1]);
      }
    },
    { alias:  'au'
    , name:   'AUR'
    , search: 'https://aur.archlinux.org/packages/?O=0&K='
    , compl:  'https://aur.archlinux.org/rpc?type=suggest&arg='
    , callback: function(response) {
        Omnibar.listWords(JSON.parse(response.text));
      }
    },
    { alias:  'al'
    , name:   'archlinux'
    , search: 'https://www.archlinux.org/packages/?arch=x86_64&q='
    , compl:  ''
    , callback: function() {}
    },
    { alias:  'wp'
    , name:   'wikipedia'
    , search: 'https://en.wikipedia.org/w/index.php?search='
    , compl:  'https://en.wikipedia.org/w/api.php?action=query&format=json&list=prefixsearch&utf8&pssearch='
    , callback: function(response) {
        var res = JSON.parse(response.text)["query"]["prefixsearch"]
          .map(function(r){
            return r.title;
          });
        Omnibar.listWords(res);
      }
    },
    { alias:  'az'
    , name:   'amazon'
    , search: 'https://smile.amazon.com/s/?field-keywords='
    , compl:  'https://completion.amazon.com/search/complete?method=completion&mkt=1&search-alias=aps&q='
    , callback: function(response) {
        var res = JSON.parse(response.text)[1];
        Omnibar.listWords(res);
      }
    },
    { alias:  'yp'
    , name:   'yelp'
    , search: 'https://www.yelp.com/search?find_desc='
    , compl:  'https://www.yelp.com/search_suggest/v2/prefetch?prefix='
    , callback: function(response) {
        var res = JSON.parse(response.text)["response"];
        var words = [];
        res.map(function(r){
          r["suggestions"].map(function(s) {
            var w = s["query"];
            if (words.indexOf(w) === -1) {
              words.push(w);
            }
          });
        });
        Omnibar.listWords(words);
      }
    },
    { alias:  'gh'
    , name:   'github'
    , search: 'https://github.com/search?q='
    , compl:  'https://api.github.com/search/repositories?sort=stars&order=desc&q='
    , callback: function(response) {
        var res = JSON.parse(response.text)["items"];
        Omnibar.listResults(res, function(s) {
          var prefix = "";
          if (s["stargazers_count"]) {
            prefix += "[★" + s["stargazers_count"] + "] "
          }
          return Omnibar.createURLItem({
            title: prefix + s["full_name"],
            url:   s["html_url"]
          });
        });
      }
    },
    { alias:  'ho'
    , name:   'hoogle'
    , search: 'https://www.haskell.org/hoogle/?hoogle='
    , compl:  'https://www.haskell.org/hoogle/?mode=json&hoogle='
    , callback: function(response) {
        var res = JSON.parse(response.text)["results"];
        Omnibar.listResults(res, function(s) {
            return Omnibar.createURLItem({
              title: s.self,
              url:   s.location
            });
        });
      }
    },
    { alias:  'hw'
    , name:   'haskellwiki'
    , search: 'https://wiki.haskell.org/index.php?go=go&search='
    , compl:  'https://wiki.haskell.org/api.php?action=opensearch&format=json&formatversion=2&namespace=0&limit=10&suggest=true&search='
    , callback: function(response) {
        Omnibar.listWords(JSON.parse(response.text)[1]);
      }
    },
    { alias:  'hy'
    , name:   'hayoo'
    , search: 'http://hayoo.fh-wedel.de/?query='
    , compl:  'http://hayoo.fh-wedel.de/json?query='
    , callback: function(response) {
        var res = JSON.parse(response.text)["result"];
        Omnibar.listResults(res, function(s) {
            return Omnibar.createURLItem({
              title: "[" + s.resultType + "] " + s.resultName,
              url:   s.resultUri
            });
        });
      }
    },
    { alias:  'ha'
    , name:   'hackage'
    , search: 'https://hackage.haskell.org/packages/search?terms='
    , compl:  'https://hackage.haskell.org/packages/search.json?terms='
    , callback: function(response) {
        var res = JSON.parse(response.text);
        Omnibar.listResults(res, function(s) {
            return Omnibar.createURLItem({
              title: s.name,
              url:   'https://hackage.haskell.org/package/' + s.name
            });
        });
      }
    },
    { alias:  'hn'
    , name:   'hackernews'
    , search: 'https://hn.algolia.com/?query='
    , compl:  'https://hn.algolia.com/api/v1/search?tags=(story,comment)&query='
    , callback: function(response) {
        var res = JSON.parse(response.text)["hits"];
        Omnibar.listResults(res, function(s) {
            var title = "";
            var prefix = "";
            if (s["points"]) {
              prefix += "[↑" + s["points"] + "] ";
            }
            if (s["num_comments"]) {
              prefix += "[↲" + s["num_comments"] + "] ";
            }
            switch(s._tags[0]) {
              case "story":
                title = s["title"];
                break;
              case "comment":
                title = s["comment_text"];
                break;
              default:
                title = s["objectID"];
            }
            return Omnibar.createURLItem({
              title: prefix + title,
              url:   "https://news.ycombinator.com/item?id=" + s["objectID"]
            });
        });
      }
    },
    { alias:  're'
    , name:   'reddit'
    , search: 'https://www.reddit.com/search?sort=relevance&t=all&q='
    , compl:  'https://api.reddit.com/search?syntax=plain&sort=relevance&limit=20&q='
    , callback: function(response) {
        var res = JSON.parse(response.text)["data"]["children"];
        Omnibar.listResults(res, function(s) {
          var d = s["data"];
          return Omnibar.createURLItem({
            title: "[" + d["score"] + "] " + d["title"],
            url:   "https://reddit.com" + d["permalink"]
          });
        });
      }
    },
    { alias:  'so'
    , name:   'stackoverflow'
    , search: 'https://stackoverflow.com/search?q='
    , compl:  'https://api.stackexchange.com/2.2/search/advanced?pagesize=10&order=desc&sort=relevance&site=stackoverflow&q='
    , callback: function(response) {
        var res = JSON.parse(response.text)["items"];
        Omnibar.listResults(res, function(s) {
          return Omnibar.createURLItem({
            title: "[" + s["score"] + "] " + s["title"],
            url:   s["link"]
          });
        });
      }
    },
    { alias:  'cs'
    , name:   'chromestore'
    , search: 'https://chrome.google.com/webstore/search/'
    , compl:  ''
    , callback: function() {}
    },
    { alias:  'cl'
    , name:   'craigslist'
    , search: 'https://craigslist.org/search/sss?query='
    , compl:  'https://craigslist.org/suggest?v=12&type=search&cat=sss&area=1&term='
    , callback: function(response) {
        Omnibar.listWords(JSON.parse(response.text));
      }
    },
    { alias:  'gd'
    , name:   'godoc'
    , search: 'https://godoc.org/?q='
    , compl:  'https://api.godoc.org/search?q='
    , callback: function(response) {
        var res = JSON.parse(response.text)["results"];
        Omnibar.listResults(res, function(s) {
          var prefix = ""
          if (s["import_count"]) {
            prefix += "[↓" + s["import_count"] + "] "
          }
          if (s["stars"]) {
            prefix += "[★" + s["stars"] + "] "
          }
          return Omnibar.createURLItem({
            title: prefix + s["path"],
            url:   "https://godoc.org/" + s["path"]
          });
        });
      }
    },
    { alias:  'gs'
    , name:   'go-search'
    , search: 'http://go-search.org/search?q='
    , compl:  'http://go-search.org/api?action=search&q='
    , callback: function(response) {
        var res = JSON.parse(response.text)["hits"]
          .map(function(r){
              return r.package;
          });
        Omnibar.listWords(res);
      }
    }
];

search.forEach(function(s) {
  la = sl + s.alias; // Search leader + alias

  addSearchAliasX(s.alias, s.name, s.search, sl, s.compl, s.callback);
  mapkey(la, '#8Search ' + s.name, function() {
    Front.openOmnibar({type: "SearchEngine", extra: s.alias})
  });
});
