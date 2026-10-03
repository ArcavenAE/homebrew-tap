class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.111033.739db21"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111033-739db21/marvel-darwin-arm64"
    sha256 "3fe5fe604128bc2cd4176d1a5ec5f96ce4d4ddd7bdcdcc20f145009deaa3c5e8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111033-739db21/marvel-darwin-amd64"
    sha256 "c551655223265ac08cef035d80220fef1642cdbf081f7f34a55b373c225f59f4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111033-739db21/marvel-linux-arm64"
    sha256 "f40bbc0072d0316cafe2f4e0ee2c4869c1c37e6a38a6e337f5de2ea6473dda11"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-111033-739db21/marvel-linux-amd64"
    sha256 "a03e0bbe1d72be168a86c0968daa82fb27761215ac0abf1fa73a7b2bfcf1e7ae"
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
