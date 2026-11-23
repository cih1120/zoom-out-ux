# zoom-out-ux

**讓 AI 跳出「只在眼前這個畫面裡修」的 UI/UX skill。**

請 AI 修一個畫面，它通常就在那個畫面裡修：換顆更好的按鈕、多加一道防呆、把同一件雜事做快一點。懂真實情境的人則會一直把它拉出來：問題在兩步之前就產生了、這件事屬於整個 app 不是這一頁、使用者早就有一個詞在叫它、說明該放在控制項旁邊、為什麼要做這件事。

`zoom-out-ux` 讓 AI 自己做這個「拉出來」的動作：出方案之前做一次，review 方案時再做一次。它一律給兩個解並排：今天的限制下最好的局部解（標出是哪個限制、誰擁有它），以及換掉題目之後的解（要改什麼、代價是什麼）。

## 五個方向

| 方向 | 問的問題 | 命中時的樣子 |
|---|---|---|
| **Earlier**（時間上游） | 問題是在哪一步變得無法避免的？誰該在哪個時間點知道什麼？ | 修補從「使用者被擋住的那一刻」移到「使用者做選擇的那一刻」。 |
| **Wider**（範圍上層） | 這屬於這一頁，還是屬於每一個問同樣問題的頁面？ | 一個全域元件或一條 policy 取代一堆逐頁的複製品。 |
| **Familiar**（既有心智模型） | 使用者已經有一個動詞、概念或控制項在做這件事嗎？ | 新發明的動作名或狀態，讓位給使用者本來就會的那個。 |
| **In place**（回到所屬情境） | 動作在它作用的東西上嗎？說明在控制項旁、在需要的當下嗎？ | 集中頁、塞滿的底列、說明頁，縮回它們原本所屬的情境；控制項搬到它影響的那一層；或名稱自己說清楚，說明就不必存在。 |
| **Different question**（換題目） | 題目本身對嗎？ | 「怎麼做快一點」變成「為什麼要做」。 |

還有一個反向動作 **Zoom back in**：題目換了，不代表可以做一個更大的功能。好的 reframe 通常是把東西拿掉。

## 九個氣味

工作還在原本框框裡的訊號：placement shopping（選項全是「放哪」）、third copy（同一個東西要放第三頁，或同一頁把同一件事講第三次）、escape hatch（在被擋住的那一刻設計出口）、prevented, not told（控制項被停用或互鎖，卻不說是哪條規則、怎樣才能用）、guardrail stacking（每個風險各補一道防呆）、explainer（加說明頁，或用 tooltip 解釋名稱）、new verb（發明新動作名）、faster chore（把重複的雜務做快）、status words（用結果狀態詞、數量或截短的路徑代替使用者真正問的關係）。每個氣味都指向先試哪個方向。見 [`skills/zoom-out-ux/SKILL.md`](skills/zoom-out-ux/SKILL.md)（skill 主文，英文）。

## Before / after

七個案例裡的兩個，短版。完整版（含一開始的提案與改掉它的那句話）在 [`references/cases.md`](skills/zoom-out-ux/references/cases.md)。

**報帳審核，一條被標記的款項凍結整份報帳。** 標成「政策例外」會把整份報帳送財務審查好幾天，而審核者選標記類型時並不知道。
*畫面內的解：* 報帳工具列多一顆「先放行未標記的款項」。
*Zoom out（Earlier、Familiar、In place）：* 選標記類型的當下就顯示後果；同時先沿用審核者本來就在用的動作「拆出這一條」，放在那條款項上。兩個解都保留：局部解受財務規則限制，重新看流程的解寫明選單要多帶什麼。

**記帳 app，記一筆支出。** 「記一筆」先放在首頁；後來預算頁和分類頁也需要；選項是「每頁各放一顆／底部常駐一個輸入列／只能回首頁記」。
*畫面內的解：* 每頁各放一顆，結果四個位置、四種長相。
*Zoom out（Wider）：* 一顆浮動的「記一筆」，出現在每個記支出說得通的頁面。「放哪」這題跟著消失。

## 有效嗎？

`evals/` 有九個情境，領域和案例不重疊（第 9 題和案例 5 同樣是餐廳，但問題不同），每題在乾淨的 session 各跑一次有 skill、一次沒有 skill。輸出原樣記錄在 `evals/results/`，用五條評分標準逐條判讀。題目見 [`evals/scenarios.md`](evals/scenarios.md)，結果見 [`evals/results/README.md`](evals/results/README.md)。

## 安裝

Claude Code：

```text
/plugin marketplace add cih1120/zoom-out-ux
/plugin install zoom-out-ux@zoom-out-ux
```

其他會讀 `SKILL.md` 資料夾的 agent：把 `skills/zoom-out-ux/` 複製到你的 skills 目錄，或

```text
npx skills add cih1120/zoom-out-ux
```

skill 本身不依賴任何單一執行環境的工具。

## 什麼時候觸發

自動：AI 準備提出一個 UI 或流程改動，而情境是使用者被擋住、一個控制項要找位置、一條規則或狀態要解釋、一件重複的雜務要做快、或一個新概念即將出現。手動：請它 review 一個方案，「zoom out on this」。

它不是視覺手藝的 skill。版面、字體、顏色、動態、文案潤飾，交給設計手藝類的 skill（例如 [impeccable](https://github.com/pbakaus/impeccable)）或你自己的設計規範。`zoom-out-ux` 在手藝之前，處理的是題目本身。

## 來源

從產品工作中反覆看到的模式整理而成：初稿一直在畫面內修補，review 一直把它拉回上游。案例是寫在虛構領域裡的綜合案例，裡面描述的產品都不存在。

## 授權

[MIT](LICENSE)
