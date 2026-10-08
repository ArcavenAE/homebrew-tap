class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.115004.757d998"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-115004-757d998/marvel-darwin-arm64"
    sha256 "a0a515a76e82781fd3267d9cb272f26e1918ca621eecdd427f515c4575485915"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-115004-757d998/marvel-darwin-amd64"
    sha256 "2447d443296f9f628f0a38d7698135c27736831d46183382d9c4a5579b66a668"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-115004-757d998/marvel-linux-arm64"
    sha256 "63c13b22a27a3d1fd221de320f89fababe977fac6be094602a8b234211265beb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-115004-757d998/marvel-linux-amd64"
    sha256 "ac082d437ce98defe46f801880e7f6d81f4b3318ea2aa16fedfc542a0efd8c2c"
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
