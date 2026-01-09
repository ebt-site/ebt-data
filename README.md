The EBT-Data repository is an aggregator of 
Early Buddhist Texts stored in 
[SuttaCentral aligned format](https://discourse.suttacentral.net/t/aligned-translations-alignment-process/39798).

The primary source of aligned texts is from the _published branch_ of the
[SuttaCentral Bilara repository](suttacentral/bilara-data](https://github.com/suttacentral/bilara-data),
which is quite large and unwieldy to process. 
The EBT-Data repository is refreshed periodically with Github Actions
that copy selected information from `bilara-data`.
The copied data is pruned to the minimal set required by sc-voice.net

In addition to having information from `bilara-data`, 
this repository is also the primary source for 
the following information which is not stored in `bilara-data`:

* Other EBT translations aligned to SuttaCentral JSON source format:q
