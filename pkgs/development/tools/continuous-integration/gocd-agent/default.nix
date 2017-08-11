{ stdenv, fetchurl, unzip }:

stdenv.mkDerivation rec {
  name = "gocd-agent-${version}-${rev}";
  version = "17.5.0";
  rev = "5095";

  src = fetchurl {
    url = "https://download.go.cd/binaries/${version}-${rev}/generic/go-agent-${version}-${rev}.zip";
    sha256 = "452aaa7031abd0ff770ccb292653e4b29ec5100779018fe4df16c2e6077e9419";
  };
  meta = with stdenv.lib; {
    description = "A continuous delivery server specializing in advanced workflow modeling and visualization";
    homepage = http://www.go.cd;
    license = licenses.asl20;
    platforms = platforms.all;
    maintainers = with maintainers; [ grahamc swarren83 ];
  };

  buildInputs = [ unzip ];

  buildCommand = "
    unzip $src -d $out
    mv $out/go-agent-${version} $out/go-agent
  ";
}
