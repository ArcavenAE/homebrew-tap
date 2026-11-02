class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.041354.1ffe387"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-041354-1ffe387/marvel-darwin-arm64"
    sha256 "1bd38f6af5d82ef47698ad40b06e2d16845afa0c8659716b68cd99eb192b31b4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-041354-1ffe387/marvel-darwin-amd64"
    sha256 "7793c14a70fb06c17cf5dce9044e357fbca5820fc220c0dd3a62311154a4e000"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-041354-1ffe387/marvel-linux-arm64"
    sha256 "4073805db64076d66ecf6a1abc172f9609d8c4c94dc00b11f451763b8ad21ce5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-041354-1ffe387/marvel-linux-amd64"
    sha256 "154fdec8bcaffe50a35f046d71ca50da60b1654d260bc53a04691a398998a5c7"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
