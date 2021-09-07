# [“비주얼 스튜디오 코드 한스펠”](https://marketplace.visualstudio.com/items?itemName=9beach.vscode-hanspell) 설정 예시

## 사용자 정의 표현식

맞춤법 검사를 한 번이라도 실행한 문서라면 수정할 때마다 사용자 정의 표현식이 자동으로 적용됩니다.

아래는 저의 `~/.hanspell-bad-expressions.json` 파일입니다. 모르고 지나치는 것보다는 나을 것 같아 거짓 경보 가능성이 높은 표현식도 몇 개 추가했습니다. 대신 분석 심각도가 `Hint`여서 눈에 띄지 않는 짧은 점선으로 표시됩니다.

`Information`이나 `Warning`으로 지정한 표현식에도 거짓 경보 가능성이나 예외는 많습니다. 예를 들어, ‘-던’이 붙는 표현은 현재형이 자연스러울 때가 많으니, ‘방문했던 장소’와 ‘배웠던 내용’을 ‘방문한 장소’와 ‘배운 내용’으로 고치도록 권하는 표현식이 있습니다. 그러나 ‘고왔던 뺑덕어멈’을 ‘고운 뺑덕어멈’으로 고칠 수는 없습니다. 예의 ‘장소’와 ‘내용’은 수식하는 말의 목적어이지만 ‘뺑덕어멈’은 주어라는 차이가 있습니다. 그리고 ‘-에서는’을 ‘-은(는)/-에/-에서/-에는’ 등으로 고치도록 권하는 표현식은 개인적 취향이어서 일반적으로 옳다고 말하기 힘듭니다. 하나하나 밝히기 힘들 만큼 예외가 많으니 참고 용도로만 쓰세요.

김정선 작가의 《[내 문장이 그렇게 이상한가요?](https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=74920327)》에서 많이 가져왔습니다.

```json
{
  "bad-expressions": [
    {
      "_comments": [
        "약간의 소금을 -> 소금 약간을",
        "일부의 군중을 -> 군중 일부를",
        "대부분의 작가는 -> 작가 대부분은",
        "대다수의 국민이 -> 국민 대다수가"
      ],
      "expression": "(^|(?<=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z’”`』」》]))(약간의|일부의|대?다수의|대부분의|소수의)((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$)",
      "info": "번역체입니다.",
      "severity": "Warning"
    },
    {
      "_comments": [
        "무엇이 있는가라는 질문을 -> 무엇이 있느냐는 질문을",
        "어디로 갈까라는 편지를 받았다 -> 어디로 가느냐는 편지를 받았다"
      ],
      "info": "‘-느냐는’으로 고쳐 보세요.",
      "expression": "[가-힣’”`』」》]+[가까]라는((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$)",
      "severity": "Warning"
    },
    {
      "_comments": [
        "천국으로의 여행이 시작되었다 -> 천국으로 여행을 시작했다",
        "너에게로 -> 너에게",
        "친구로부터 편지를 받았다 -> 친구에게 편지를 받았다"
      ],
      "info": "조사를 겹쳐 썼습니다.",
      "expression": "[가-힣’”`』」》]+(부터의|와의|로의|에게로|에게서|에의|로부터)((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$)",
      "severity": "Warning"
    },
    {
      "_comments": [
        "액션 측면에서는 괜찮았어 -> 액션 측면은 괜찮았어",
        "음악이 나오는 광고에서는 이 화면이 좋아요 -> 음악이 나오는 광고에는 이 화면이 좋아요"
      ],
      "info": "‘-은(는)/-에/-에서/-에는’ 등으로 바꾸어 보세요.",
      "expression": "[가-힣’”`』」》]+(에서는)((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$)",
      "severity": "Warning"
    },
    {
      "_comments": [
        "축구 또는 야구 -> 축구나 야구",
        "축구 및 야구 -> 축구나 야구"
      ],
      "info": "부자연스러운 표현입니다.",
      "expression": "(^|(?<=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z’”`』」》]))(혹은|또는|및)((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$)",
      "severity": "Warning"
    },
    {
      "_comments": [
        "예술가가 될 수 있는 가능성 -> 예술가가 될 가능성",
        "예술가가 될 수 있을지 모르겠다 -> 예술가가 될는지 모르겠다"
      ],
      "info": "없어도 뜻이 달라지지 않으면 쓸 필요가 없습니다.",
      "expression": "(^|(?<=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z’”`』」》]))수 있[는을][가-힣]*",
      "severity": "Warning"
    },
    {
      "info": "한 문단에 ‘그래서/따라서/그러므로’가 두 번 이상 나옵니다.",
      "expression": "(그래서|따라서|그러므로)[^\n]*(그래서|따라서|그러므로)",
      "severity": "Warning"
    },
    {
      "_comments": [
        "축구에 관해 이야기하자 -> 축구 이야기하자",
        "작전에 의해 승리해서 -> 작전으로 승리해서(이겨서)",
        "실수로 인해 -> 실수로",
        "문제를 풀기 위해 -> 문제를 풀려고"
      ],
      "info": "번역체입니다.",
      "expression": "[가-힣’”`』」》]+(에 [의관대][한해하]|로 인[한해하]|[을를기] 위(해|하여))[가-힣]*",
      "severity": "Warning"
    },
    {
      "_comments": [
        "산다는 것의 의미 -> 사는 의미",
        "내 가슴에 있는 추억 -> 내 가슴속의 추억",
        "축구공을 가지고 멀리차기 놀이를 -> 축구공(으로) 멀리차기 놀이를",
        "죽게 되고 -> 죽고",
        "알려져 있는 -> 알려진",
        "알려 줍니다 -> 알립니다"
      ],
      "info": "군더더기 있는 표현입니다.",
      "expression": "[가-힣’”`』」》]+([다라]는 +것|에 +있는|[을를] +(가[지진질집져졌]|갖는|지[니닌닐닙녀녔])|게 +[되된될됩돼됐]|[져라고아] +있|[혀해여려겨] +[주준줄줍줘줬])[가-힣]*",
      "severity": "Information"
    },
    {
      "_comments": [
        "하는가를 물어봐라 -> 하는지 물어봐라",
        "누구인가 보고 -> 누구인지 보고"
      ],
      "info": "‘-ㄴ지’로 고쳐 보세요.",
      "expression": "[가-힣’”`』」》]+[는인]가를?((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$)",
      "severity": "Information"
    },
    {
      "info": "‘-여서(해서)’로 바꾸어 보세요.",
      "expression": "[가-힣’”`』」》]+기 +때문[가-힣]*",
      "severity": "Information"
    },
    {
      "_comments": [
        "방문했던 장소 -> 방문한 장소",
        "배웠던 내용 -> 배운 내용",
        "놀랬던 기억 -> 놀란 기억",
        "참고로, 아래의 ‘갔겄겼갰깠껐꼈깼...’은 제가 대충 지어낸 엉터리입니다. 믿지 마세요."
      ],
      "info": "‘-던’이 붙는 표현은 현재형이 자연스러울 때가 많습니다.",
      "expression": "[가-힣]+[갔겄겼갰궜깠껐꼈깼꽜꿨났넜녔냈놨눴닸뎠댔뒀땄떴뗬땠랐렀렸랬뤘몄맸볐뱄봤붰빴뻤뼜뺐샀섰셨샜쉈쌌쌨쐈쒔았었였앴왔웠잤졌쟀줬짰쩠쪘쨌쫬쭸찼첬쳤챘췄컸켰캤탔텄텼탰퉜팠펐폈팼혔했]던((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$)",
      "severity": "Information"
    },
    {
      "_comment": "많은 영향을 받는다 -> 영향을 많이 받는다",
      "expression": "[가-힣’”`』」》]+은 +[가-힣’”`』」》]+[을를]((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$)",
      "info": "번역체입니다.",
      "severity": "Hint"
    },
    {
      "info": "‘-시키다’를 ‘-하다’로 고쳐 보세요.",
      "expression": "[가-힣’”`』」》]+시[키킨킬킵켜켰][가-힣]*",
      "severity": "Hint"
    },
    {
      "_comments": [
        "실수였다. 그런 실수는 다시 하기 싫었다. -> 실수였다. 다시 하기 싫은 실수였다.",
        "사랑했다. 그 사랑은 정말 뜨거웠다. -> 사랑했다. 정말 뜨거운 사랑이었다."
      ],
      "info": "지시대명사를 빼고 다듬어 보세요.",
      "expression": "(^|(?<=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z’”`』」》]))(그|이|저|이런|그런|저런|그러한|이러한|저러한)((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$)",
      "severity": "Hint"
    },
    {
      "_comments": [
        "토론을 하기에 좋은 장소 -> 토론하기에 좋은 장소",
        "축구를 하자 -> 축구 하자"
      ],
      "info": "‘을(를)’을 빼고 다듬어 보세요.",
      "expression": "[가-힣’”`』」》]+[을를] ([하했해합][가-힣]+|할((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$))",
      "severity": "Hint"
    },
    {
      "_comment": "사랑하는 것은 -> 사랑이란",
      "info": "‘것’을 빼고 다듬어 보세요.",
      "expression": "[가-힣’”`』」》]+[은는] +것[가-힣]*",
      "severity": "Hint"
    },
    {
      "_comments": [
        "놀라기 시작했다 -> 놀랬다",
        "슬퍼지기 시작했다 -> 슬퍼졌다"
      ],
      "info": "시작과 끝을 강조할 필요가 있는지 생각해 보세요.",
      "expression": "[가-힣]+기 시작[가-힣]+",
      "severity": "Hint"
    },
    {
      "_comments": [
        "돌아가라고 말했다 -> 돌아가라고 말했다",
        "고치라고 권하는 -> 고치도록 권하는"
      ],
      "info": "‘-도록’과 비교해서 자연스러운 표현을 고르세요.",
      "expression": "[가-힣’”`』」》]+라고((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$)",
      "severity": "Hint"
    },
    {
      "_comment": "우리의 사랑의 결실 -> 우리 사랑의 결실",
      "info": "한 문장에 ‘-의’가 두 번 이상 나옵니다.",
      "expression": "[가-힣’”`』」》]+의 +[가-힣a-zA-Z ]+[가-힣a-zA-Z]의((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$)",
      "severity": "Hint"
    },
    {
      "_comment": "철수를 어떻게 얼굴을 잊을까 -> 어떻게 철수 얼굴을 잊을까",
      "info": "한 문장에 ‘-을(를)’이 두 번 이상 나옵니다.",
      "expression": "[가-힣’”`』」》]+[을를] +[가-힣a-zA-Z ]+[가-힣a-zA-Z][을를]((?=[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z])|$)",
      "severity": "Hint"
    }
  ]
}
```

## 맞춤법 검사 제외 문자열

저의 `~/.hanspell-ignore` 파일입니다. 주로 정규 표현식이나 마크업, URL을 맞춤법 검사에서 제외하는 [글로브 패턴](<https://ko.wikipedia.org/wiki/%EA%B8%80%EB%A1%9C%EB%B8%8C_(%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D)>)입니다.

```rc
?
*http*/**
**/.*http*/**
*<[a-zA-Z]*>*
*</[a-zA-Z]*>*
*</[a-zA-Z]*></[a-zA-Z]*>*
*[!가-힣 ][!가-힣 ][!가-힣 ][!가-힣 ]*
*[!ㄱ-ㅎㅏ-ㅣ가-힣 ].[a-zA-Z]*
*[!ㄱ-ㅎㅏ-ㅣ가-힣 ]/.[a-zA-Z]*
**/[a-z]*[a-z]/**
*/*^*/g*
*[?][<=]*
*[[]?-?[\]]*
*[가-힣[\]]|[가-힣[\]]*
+[[]*
```
