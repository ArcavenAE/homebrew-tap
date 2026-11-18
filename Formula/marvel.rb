class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261118.175117.cf01437"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-175117-cf01437/marvel-darwin-arm64"
    sha256 "fc1baef681573870747c0432849a781b870e8c3cc0bbadb5d601bf8674d9e0ba"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-175117-cf01437/marvel-darwin-amd64"
    sha256 "69621d946c24f25d9489c0c7e67f175f2601cb83e3af4fd3170e05556d479ecd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-175117-cf01437/marvel-linux-arm64"
    sha256 "300c470ef026d7c0fa831c8d01478a704aa2177615687c4992fa2ce6c74eaae4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-175117-cf01437/marvel-linux-amd64"
    sha256 "b1ecaef11628b77fade6a9f4c0497e4e3bf1e7bc51075dcd102d5ceb437830bd"
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
