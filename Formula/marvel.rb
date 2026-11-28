class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261128.014338.6682616"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-014338-6682616/marvel-darwin-arm64"
    sha256 "3b8cb62f2ffa652f8a31847d58628fb411955540ace1b491276547919382422b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-014338-6682616/marvel-darwin-amd64"
    sha256 "0c8cfdd09ce8c7dba7f27733534ae14266c6fca2241904b4c8ba9fee2853ff4e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-014338-6682616/marvel-linux-arm64"
    sha256 "feea24b874bfc4fe7037afc54e3d73235d52b4a31eea510813d170a126bdbf46"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261128-014338-6682616/marvel-linux-amd64"
    sha256 "462c626b916702e34ffe86ca93fdbfb8cef98b46c1658ed4072c198cc90ffff5"
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
