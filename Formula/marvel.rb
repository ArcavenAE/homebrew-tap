class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260808.174117.5aad3fb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-174117-5aad3fb/marvel-darwin-arm64"
    sha256 "f101dd1e0e0d8c203ef828f8492c0305a18d17ae3423e3c2e4ee26a5fe4624e7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-174117-5aad3fb/marvel-darwin-amd64"
    sha256 "5f7494def1ddad182c04ecdfa911c3c193eaf99c043aa6b65b87d222bd8cd18c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-174117-5aad3fb/marvel-linux-arm64"
    sha256 "b07fd5a9294efe519ca0cef42394b306b209d9921b3564bcd3c09b066c78596b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-174117-5aad3fb/marvel-linux-amd64"
    sha256 "e02379e10e4251297d1eaeba383239b88f37959f63d358434da6858c7176e80d"
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
