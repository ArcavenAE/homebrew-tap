class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.153934.a54b9c1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-153934-a54b9c1/marvel-darwin-arm64"
    sha256 "29543aa8f262590758f1e1318e868f2cb2e2e18dcf0354b7d0e49bcbee08effe"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-153934-a54b9c1/marvel-darwin-amd64"
    sha256 "4c695d1f2be09b877e1c7366f8b623f33ff6d8183edf13f434269fb9e8397c28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-153934-a54b9c1/marvel-linux-arm64"
    sha256 "8e0f49ffb681261fddbe382f2144580557e8b08cb9c0cb88eb14ccc0540f4091"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-153934-a54b9c1/marvel-linux-amd64"
    sha256 "f187bcedc877e4b58a40bb9c5c53e66a441542cf5faa593fef7c633d6e38de66"
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
