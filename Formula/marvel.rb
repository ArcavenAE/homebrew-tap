class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.230521.1387ecd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-230521-1387ecd/marvel-darwin-arm64"
    sha256 "17ca5e681056951a3fea5cd4b0e4a1f4b88235a8d4e330f0dae367ac2a8dd6d6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-230521-1387ecd/marvel-darwin-amd64"
    sha256 "e3e7a934ad64a13993d7213c00cbc25608042970929aca2417ea02bf5933ffd6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-230521-1387ecd/marvel-linux-arm64"
    sha256 "a684612459cad544602431aead23e9b2b57c41ac440c41e02589a6a5752233ac"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-230521-1387ecd/marvel-linux-amd64"
    sha256 "797bbf0d4bf204ce1f9d61d556f9bee4a0cb62a25f503967df58b3661ece8332"
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
