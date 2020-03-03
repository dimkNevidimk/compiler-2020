# docker run --rm -it -v `pwd`/:/home/opam/compilers-2020 lama-build:1

FROM ocaml/opam2:4.07
RUN sudo apt-get -y update && \
	sudo apt-get install -y gcc-multilib m4 && \
	sudo apt-get clean
RUN echo "source $HOME/.opam/opam-init/init.sh &> /dev/null" >> $HOME/.bashrc && \
	eval $(opam env) && \
	opam pin add -n ostap https://github.com/dboulytchev/ostap.git#memoCPS && \
	opam pin add -y lama https://github.com/JetBrains-Research/Lama.git
WORKDIR $HOME/compilers-2020
