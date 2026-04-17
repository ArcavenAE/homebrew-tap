class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.204353.915bf7c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204353-915bf7c/marvel-darwin-arm64"
    sha256 "3be94ecf49a4dada261b339a2548f938d85626d2b0852c82900cc6ea1126687e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204353-915bf7c/marvel-darwin-amd64"
    sha256 "0f2dbb4b3e11d315fd776cf91a577a6a7bfc87c7d30258f473c516e65328558d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204353-915bf7c/marvel-linux-arm64"
    sha256 "2947935ca3b273b1fe2ff26724709860481c0ebc7f068672b45b09099bc3fd56"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204353-915bf7c/marvel-linux-amd64"
    sha256 "59dda67422767f01e8dee201632796ec71cd19fc76cc18d3e7be92aa6754bde6"
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
