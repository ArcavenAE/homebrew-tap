class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261005.224911.6bc4961"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-224911-6bc4961/marvel-darwin-arm64"
    sha256 "fbed0d1e59e699c710cc32f890bfdc6ee330c765037a43b3b7d94130c7b241e6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-224911-6bc4961/marvel-darwin-amd64"
    sha256 "c657da1e33c945cabad153addb53df9375867864aa109409d7e54fa314d46db2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-224911-6bc4961/marvel-linux-arm64"
    sha256 "d1b9aefa6a3bfa3e892ea36e76a615adf6d4fbdc87063a36e80d61cf2b5bd842"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-224911-6bc4961/marvel-linux-amd64"
    sha256 "b72ed51ed72eda51a36967f556c063685ceea6f06086a29f1cb61b687bacc287"
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
