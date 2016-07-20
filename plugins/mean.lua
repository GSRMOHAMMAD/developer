local function run(msg, matches)
  local htp = http.request('http://api.vajehyab.com/v2/public/?q='..URL.escape(matches[1]))
  local data = json:decode(htp)
	return 'کلمه : '..(data.data.title or data.search.q)..'\n\nمعنی : '..(data.data.text or '----' )..'\n\nمنبع : '..(data.data.source or '----' )..'\n\n'..(data.error.message or '')..'\n\n@FORCETG_CH'
end
return {
  patterns = {
    "^[!#/][Mm][Ee][Aa][Nn] (.*)$",
    "^معنی (.*)$"
  },
  run = run
}
