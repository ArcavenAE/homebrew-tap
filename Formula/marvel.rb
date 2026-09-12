class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260912.182553.f191222"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-182553-f191222/marvel-darwin-arm64"
    sha256 "f2c7741a1686445f9c007d44a23148359914e583d57c3db8a16a1f5a4bdf7725"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-182553-f191222/marvel-darwin-amd64"
    sha256 "20df87a4a79ca93a9b1a7451a19b52efded446cf3d6a593093ae51704db32f48"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-182553-f191222/marvel-linux-arm64"
    sha256 "2c9fb46db0a88c53d83f223c612a7207eff92ac69bc86b4b85e6a053a0e0efe3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-182553-f191222/marvel-linux-amd64"
    sha256 "469e2f3e87cea7fb1f03addb9c05587d05a1e55794d70428e8ce30ce0581bb27"
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
