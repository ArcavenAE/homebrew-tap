class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260912.232431.e6c8956"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-232431-e6c8956/marvel-darwin-arm64"
    sha256 "850c47221ba60136bec9bacf1d1eaaf93d4476800c66dc985da6e1ad3ea1e1c2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-232431-e6c8956/marvel-darwin-amd64"
    sha256 "c673187e712f068a1c7f3da113f6cb307d8230bf70026f1540c4897dd5544ab1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-232431-e6c8956/marvel-linux-arm64"
    sha256 "5d79924ff5802cd8a99036020c499e2e1733865071a78a6678749f3685e545c4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260912-232431-e6c8956/marvel-linux-amd64"
    sha256 "fadf2b218cad9b941c637138398e857a529c95addea996c1cd921abb9b15d593"
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
