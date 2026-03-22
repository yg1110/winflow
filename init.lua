local mash = {"cmd", "alt"}

local function moveWindow(fn)
  local win = hs.window.focusedWindow()
  if not win then return end
  local screen = win:screen():frame()
  win:setFrame(fn(screen))
end

local function fullscreen()
  local win = hs.window.focusedWindow()
  if win then win:setFrame(win:screen():frame()) end
end

local lastArrow = nil

local function onArrow(key, single)
  if lastArrow == key then
    lastArrow = nil
    fullscreen()
  else
    lastArrow = key
    single()
  end
end

-- 왼쪽 절반 / 풀스크린
hs.hotkey.bind(mash, "Left", function()
  onArrow("left", function()
    moveWindow(function(s)
      return {x=s.x, y=s.y, w=s.w/2, h=s.h}
    end)
  end)
end)

-- 오른쪽 절반 / 풀스크린
hs.hotkey.bind(mash, "Right", function()
  onArrow("right", function()
    moveWindow(function(s)
      return {x=s.x+s.w/2, y=s.y, w=s.w/2, h=s.h}
    end)
  end)
end)

-- 위 절반 / 풀스크린
hs.hotkey.bind(mash, "Up", function()
  onArrow("up", function()
    moveWindow(function(s)
      return {x=s.x, y=s.y, w=s.w, h=s.h/2}
    end)
  end)
end)

-- 아래 절반 / 풀스크린
hs.hotkey.bind(mash, "Down", function()
  onArrow("down", function()
    moveWindow(function(s)
      return {x=s.x, y=s.y+s.h/2, w=s.w, h=s.h/2}
    end)
  end)
end)

-- macOS 네이티브 전체화면 토글
hs.hotkey.bind(mash, "G", function()
  local win = hs.window.focusedWindow()
  if not win then return end
  win:setFullScreen(not win:isFullScreen())
end)

-- 가운데 (75% 크기)
hs.hotkey.bind(mash, "C", function()
  moveWindow(function(s)
    local w = s.w * 0.75
    local h = s.h * 0.75
    return {x=s.x+(s.w-w)/2, y=s.y+(s.h-h)/2, w=w, h=h}
  end)
end)

-- 4분할 — 좌상단
hs.hotkey.bind(mash, "U", function()
  moveWindow(function(s)
    return {x=s.x, y=s.y, w=s.w/2, h=s.h/2}
  end)
end)

-- 4분할 — 우상단
hs.hotkey.bind(mash, "I", function()
  moveWindow(function(s)
    return {x=s.x+s.w/2, y=s.y, w=s.w/2, h=s.h/2}
  end)
end)

-- 4분할 — 좌하단
hs.hotkey.bind(mash, "J", function()
  moveWindow(function(s)
    return {x=s.x, y=s.y+s.h/2, w=s.w/2, h=s.h/2}
  end)
end)

-- 4분할 — 우하단
hs.hotkey.bind(mash, "K", function()
  moveWindow(function(s)
    return {x=s.x+s.w/2, y=s.y+s.h/2, w=s.w/2, h=s.h/2}
  end)
end)

-- 다음 모니터로 이동
hs.hotkey.bind(mash, "]", function()
  local win = hs.window.focusedWindow()
  if not win then return end
  win:moveToScreen(win:screen():next(), true, true)
end)

-- 이전 모니터로 이동
hs.hotkey.bind(mash, "[", function()
  local win = hs.window.focusedWindow()
  if not win then return end
  win:moveToScreen(win:screen():previous(), true, true)
end)

-- 리로드
hs.hotkey.bind(mash, "R", function()
  hs.reload()
end)

--  열기
hs.hotkey.bind(mash, "A", function()
  hs.execute("cursor /Users/yg/Documents/codeInsight", true)
end)

hs.alert.show("winflow 로드 완료 ✓")