## [DeepMount00/Italian-ModernBERT-base](https://huggingface.co/DeepMount00/Italian-ModernBERT-base)

```4d
var $en; $fr : 4D.Vector
var $AIClient : cs.AIKit.OpenAI
var $cosineSimilarity : Real
$AIClient:=cs.AIKit.OpenAI.new()

$AIClient.baseURL:="http://127.0.0.1:8080/v1"  // llama-server

$inputs:=[\
"In bocca al lupo per il tuo esame!"; \
"Ti auguro tanto successo per la prova."\
]

$batch:=$AIClient.embeddings.create($inputs)

$it1:=$batch.embeddings[0].embedding
$it2:=$batch.embeddings[1].embedding

$cosineSimilarity:=$it1.cosineSimilarity($it2)
```

##### Cosine similarity from example code above:

||llama.cpp `Q8_0`|ONNX Runtime `Int8`|
|-|-:|-:|
|🇮🇹|`0.897655893356`|`0.8163768461052`|
