FROM markhibberd/base:latest

ENV LANG C.UTF-8

WORKDIR /ghc/installs
RUN curl -O https://downloads.haskell.org/~ghc/8.2.2/ghc-8.2.2-x86_64-deb8-linux.tar.xz && \
  tar xf ghc-8.2.2-x86_64-deb8-linux.tar.xz && \
  cd /ghc/installs/ghc-8.2.2 && \
  ./configure --prefix=/ghc/8.2.2 && \
  make install && \
  for x in ghc ghc-pkg ghci haddock hlint hp2ps hpc hsc2hs runghc runhaskell; do \
    ln -s /ghc/8.2.2/bin/$x /usr/local/bin/$x; \
  done && \
  cd /ghc && \
  rm -rf /ghc/installs

WORKDIR /ghc/installs
RUN curl -O https://hackage.haskell.org/package/cabal-install-2.0.0.0/cabal-install-2.0.0.0.tar.gz && \
  tar xf cabal-install-2.0.0.0.tar.gz && \
  cd /ghc/installs/cabal-install-2.0.0.0 && \
  ./bootstrap.sh && \
  ln -s /root/.cabal/bin/cabal /usr/local/bin/cabal && \
  cd /ghc && \
  rm -rf /ghc/installs

WORKDIR /mafia
RUN curl -O https://raw.githubusercontent.com/markhibberd/mafia/master/script/mafia && \
  chmod +x mafia && \
  ./mafia upgrade && \
  cp /root/.mafia/versions/mafia /usr/local/bin/mafia
