# winflow

macOS용 [Hammerspoon](https://www.hammerspoon.org/) 설정으로, 키보드만으로 활성 창을 화면 절반·4분할·중앙·전체 화면 등으로 배치하고 모니터 간 이동까지 할 수 있습니다.

## 클론

이 저장소를 받으려면:

```bash
git clone https://github.com/yg1110/winflow.git
```

로컬에서 Hammerspoon이 읽는 경로는 보통 `~/.hammerspoon`입니다. 원하는 방식 중 하나로 맞추면 됩니다.

- **방법 A**: 클론한 폴더를 `~/.hammerspoon`으로 쓰기  
  `winflow`를 `~/.hammerspoon`에 클론하거나, 이미 다른 이름으로 클론했다면 심볼릭 링크로 연결합니다.

  ```bash
  git clone https://github.com/yg1110/winflow.git ~/.hammerspoon
  ```

- **방법 B**: 기존 `~/.hammerspoon`이 있다면 `init.lua`만 이 저장소 내용으로 덮어쓰거나 병합합니다.

## 요구 사항

- macOS
- [Hammerspoon](https://www.hammerspoon.org/) 설치 후 **접근성(Accessibility)** 권한 허용

설치 후 Hammerspoon 메뉴에서 **Reload Config** 하거나, 아래 단축키로 설정을 다시 불러올 수 있습니다.

## 단축키 (모디파이어: ⌘ Cmd + ⌥ Alt)

| 단축키 | 동작 |
|--------|------|
| `⌘⌥ ←` | 창을 화면 **왼쪽 절반** |
| `⌘⌥ →` | 창을 화면 **오른쪽 절반** |
| `⌘⌥ ↑` | 창을 화면 **위 절반** |
| `⌘⌥ ↓` | 창을 화면 **아래 절반** |
| `⌘⌥ F` | 현재 화면에 **최대화** (프레임을 화면 전체로) |
| `⌘⌥ C` | 화면 **가운데**, 가로·세로 각 **75%** 크기 |
| `⌘⌥ U` | 4분할 **좌상단** |
| `⌘⌥ I` | 4분할 **우상단** |
| `⌘⌥ J` | 4분할 **좌하단** |
| `⌘⌥ K` | 4분할 **우하단** |
| `⌘⌥ N` | **다음** 디스플레이로 창 이동 |
| `⌘⌥ P` | **이전** 디스플레이로 창 이동 |
| `⌘⌥ G` | macOS **전체 화면(Full Screen)** 토글 |
| `⌘⌥ R` | Hammerspoon 설정 **다시 로드** (`hs.reload()`) |

## 구성 파일

- `init.lua` — 위 단축키와 창 배치 로직이 모두 여기에 있습니다.

설정을 바꾼 뒤에는 `⌘⌥ R`으로 리로드하거나 Hammerspoon에서 Reload 하면 반영됩니다.