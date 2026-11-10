class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261110.160651.2ca4c09"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-160651-2ca4c09/marvel-darwin-arm64"
    sha256 "23c4fd86a7afa4b46ff3382d1cb25d45dc16f3d117bbe05a6a42581c05c48be3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-160651-2ca4c09/marvel-darwin-amd64"
    sha256 "d32ecd6de4402602feaf6ab3cb677d59f82afbb0f249a66da855ed58d23b1eae"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-160651-2ca4c09/marvel-linux-arm64"
    sha256 "c667a4e27c696dd2cdbfb3e64b0067e9a8eeee08456881c5d98296ec99013018"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-160651-2ca4c09/marvel-linux-amd64"
    sha256 "c7775b48f9406679818da6ad8a474f0c9185d1018e1711996e58f5174d79a0c2"
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
