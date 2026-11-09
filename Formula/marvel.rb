class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.024016.22496f5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-024016-22496f5/marvel-darwin-arm64"
    sha256 "07415afa2e4b3d766fc4e1930890c0f6d9121118575b15b7eaf868731d7147ea"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-024016-22496f5/marvel-darwin-amd64"
    sha256 "74865e6b4643075f06004f61d2b5a7852314efd0c2f32ea078bc3bdedbc575a6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-024016-22496f5/marvel-linux-arm64"
    sha256 "9a0d1f5eed3b7ea5775f1909210f7413b7188573ddd516fbd82ba0f5b3d4b8b3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-024016-22496f5/marvel-linux-amd64"
    sha256 "98114d2fb640823db32c486b7235ff66a1d99a666ed6eb19fd833e890083137e"
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
