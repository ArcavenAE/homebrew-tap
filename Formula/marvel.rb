class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261028.050908.b61c89c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-050908-b61c89c/marvel-darwin-arm64"
    sha256 "1642c801f5477b1b57685ef5892fd66a9bf6c1b5c0781e56501b5de573c36fca"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-050908-b61c89c/marvel-darwin-amd64"
    sha256 "a22aac624c39469be0f9bef34a191cbed74891382e2502556aabac8647d6bc5b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-050908-b61c89c/marvel-linux-arm64"
    sha256 "9fad0a5cf8746f36622ae65ac295c5af6799755877049768a43ac0ed3246e793"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-050908-b61c89c/marvel-linux-amd64"
    sha256 "44e42ec72bc1939c4113c803250bc356729721ff79a75aa87c496e56fc5e4240"
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
