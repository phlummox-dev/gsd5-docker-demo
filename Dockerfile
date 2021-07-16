
FROM basho/build-essential:ubuntu-16.04@sha256:8f9f42c8e44a7ec813420fba06e7eb9d5af8e2f6132e7eae7bb9f995b362da9c \
  AS builder

WORKDIR /work

# use the following tag or commit for gsd5-core
ARG gsd5_commit=b78b55ea

# script to copy everything in the repo 
# into flat gsd5/js and gsd5/tiddlers directories.
COPY flatten_gsd5.sh /tmp

RUN \
  git clone https://gitlab.com/gsd5-tiddlywiki/gsd5-core . && \
  git checkout $gsd5_commit && \
  mkdir -p /build/gsd5 && \
  /tmp/flatten_gsd5.sh . /build/gsd5

FROM mazzolino/tiddlywiki@sha256:fbccecb15694599c11445b6fe100327da77c87fb91267918e0fbad3398a5f828 \
  AS runner
# ^ Hm. Not a v nice docker bundling - almost all configuration options are hard-coded
# AND uses basic authentication - blegh.

# To add gsd5 as a plugin, we can either run something like
#    tiddlywiki ++/usr/share/gsd5 mywiki --port 8080
# OR copy it into mywiki/plugins.
COPY --from=builder /build/gsd5 /usr/share/gsd5

# uses deprecated '--server' argument to tiddlywiki --
# should fix this
ADD init-and-run-wiki /usr/local/bin/init-and-run-wiki


