class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.031225.e44400c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-031225-e44400c/marvel-darwin-arm64"
    sha256 "8068f7c5eef1fc12d79f6e56dbfbf0be066566f6a2c8bde6aa133605101090a3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-031225-e44400c/marvel-darwin-amd64"
    sha256 "1adf3f8205fb14e4af0625e4eb8e8ac31999d9d0347fafddfebe6f51849dc3b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-031225-e44400c/marvel-linux-arm64"
    sha256 "e7c4d96590552139ce2faed610b35122c437d2109f785599cf7acf8ffe1a9a0c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-031225-e44400c/marvel-linux-amd64"
    sha256 "f2ea3b33ba1a724236d84dc9cdc5efbb2a65544ded8c140d203fe36d645ba1e4"
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
