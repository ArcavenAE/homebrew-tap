class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.122000.5237ea1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-122000-5237ea1/marvel-darwin-arm64"
    sha256 "080aadb711f81ac1aacddba4ad87b80b8cb270246c65ad308db9c705c200db12"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-122000-5237ea1/marvel-darwin-amd64"
    sha256 "ddd5a1016f8c3f0a3a596e1a460ec58c4f659216ea6be08eef78ea4c3cbac791"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-122000-5237ea1/marvel-linux-arm64"
    sha256 "f35541307d1c7e084cfc89e94720d08c85d1fa9955c81dfed5e9f7311b77543a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-122000-5237ea1/marvel-linux-amd64"
    sha256 "b439956802be7cb2561302643092675e6221388b021e544c7b2d3dc3a27881f1"
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
